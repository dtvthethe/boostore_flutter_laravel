<?php

namespace App\Exceptions;

use Throwable;
use Illuminate\Validation\ValidationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    public function render($request, Throwable $e)
    {
        switch (true) {
            case $e instanceof ValidationException:
                return response()->json([
                    'status' => Response::HTTP_UNPROCESSABLE_ENTITY,
                    'data' => $e->errors(),
                    'messages' => $e->getMessage(),
                ]);
            default:
                Log::error($e);

                return response()->json([
                    'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
                    'data' => [],
                    'messages' => $e->getMessage(),
                ]);
        }
    }
}
