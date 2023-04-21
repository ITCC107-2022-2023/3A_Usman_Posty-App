<?php

namespace App\Http\Controllers\API;

use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::with('users')->get();
        return response()->json($posts, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'body' => 'required',
            ]);
            if ($validator->fails()) {
                $errors = [
                    'success' => false,
                    'error' => $validator->errors(),
                ];
                return response()->json($errors, 400);
            }
            $posts = Post::create([
                'user_id' => Auth::user()->id,
                'body' => $request->input('body'),
            ]);
            return response()->json($posts, 201);
        } catch (\Exception $e) {
            $errors = [
                'message' => $e->getMessage(),
            ];
            return response()->json($errors, 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $post = Post::find($id);
            if (!$post) {
                $data = [
                    'message' => 'Post Not Found',
                ];
                return response()->json($data, 404);
            }
            if ($post->user_id !== auth()->id()) {
                $data = [
                    'message' => 'You are not authorized to update this post',
                ];
                return response()->json($data, 403);
            }
            $validator = Validator::make($request->all(), [
                'body' => 'required',
            ]);
            if ($validator->fails()) {
                $data = [
                    'success' => false,
                    'error' => $validator->errors(),
                ];
                return response()->json($data, 400);
            }
            $post->body = $request->input('body');
            $post->save();
            $data = [
                'success' => true,
                'message' => 'Posts updated successfully',
                'updated_post' => $post,
            ];
            return response()->json($data, 202);
        } catch (\Exception $e) {
            $errors = [
                'message' => $e->getMessage(),
            ];
            return response()->json($errors, 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $post = Post::find($id);
            if ($post->user_id !== auth()->id()) {
                $data = [
                    'message' => 'You are not authorized to delete this post',
                ];
                return response()->json($data, 403);
            }
            if ($post) {
                $post->delete();
                $data = [
                    'success' => true,
                    'message' => 'Post was successfully destroyed.',
                    'deleted_post' => $post,
                ];
                return response()->json($data, 202);
            }
            $data = [
                'success' => false,
                'message' => 'Posts doesn\'t  Exists',
            ];
            return response()->json($data, 404);
        } catch (\Exception $e) {
            $errors = [
                'message' => $e->getMessage(),
            ];
            return response()->json($errors, 500);
        }
    }
}
