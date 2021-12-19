<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    const APPEND_NUMBER_USER = 8;
    const PWD_DEAFULT = '$2y$10$ybDcemBcmCmlwBxLGWYTlOOR1sswdVM6me2pnjjWqebVz1V6ORyVC';

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::truncate();
        $userDefaults = [
            [
                'password' => self::PWD_DEAFULT,
                'phone' => '09999999999',
                'avatar' => 'users/admin.png',
                'display_name' => 'Admin',
            ],
            [
                'password' => self::PWD_DEAFULT,
                'phone' => '09999999998',
                'avatar' => 'users/guest.png',
                'display_name' => 'Guest',
            ],
        ];

        array_walk($userDefaults, function($item) {
            $user = new User([
                'password' => $item['password'],
                'phone' => $item['phone'],
                'avatar' => $item['avatar'],
                'display_name' => $item['display_name'],
            ]);
            $user->save();
        });

        User::factory()->count(self::APPEND_NUMBER_USER)->create();
    }
}
