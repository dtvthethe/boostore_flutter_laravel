<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Role::truncate();
        $roleDefaults = [
            ['name' => 'Admin'],
            ['name' => 'Guest'],
        ];

        array_walk($roleDefaults, function ($item) {
            $role = new Role([
                'name' => $item['name'],
            ]);
            $role->save();
        });
    }
}
