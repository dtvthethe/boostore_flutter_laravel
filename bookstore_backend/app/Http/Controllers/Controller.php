<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    /**
     * Get log.
     *
     * @return string
     */
    public function getLog() {
        $output = shell_exec('tail -n 1000 ' . storage_path() . '/logs/laravel.log');

        echo "<pre>$output</pre>";
    }
}
