<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateColumnToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn([
                'email',
                'email_verified_at',
                'name',
            ]);
        });

        Schema::table('users', function (Blueprint $table) {
            $table->string('phone', 11)->unique()->nullable(false);
            $table->string('avatar');
            $table->string('display_name');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn([
                'phone',
                'display_name',
                'avatar',
            ]);
        });

        Schema::table('users', function (Blueprint $table) {
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('name');
        });
    }
}
