<?php

namespace Database\Seeders;

use App\Models\Permission;
use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    const APPEND_NUMBER_USER = 2;
    const ADMIN_ID = 1;
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

        $roles = Role::where('id', Role::ADMIN)->get();

        $roles->each(function(Role $role) {
            $role->permissions()->sync(Permission::VIEW_STOCK_QUANTIRY);
        });

        $users = User::all();

        // Set rol and permission
        // Admin role: has permission to view product stock quantiry.
        // Other role: can't view product stock quantiry.
        $users->each(function(User $user) {
            if ($user->id === self::ADMIN_ID) {
                $user->roles()->sync(Role::ADMIN);
            } else {
                $user->roles()->sync(Role::GUEST);
            }
        });
    }
}
