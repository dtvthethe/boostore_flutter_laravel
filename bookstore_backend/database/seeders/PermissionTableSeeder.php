<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::truncate();
        $permissionDefaults = [
            ['name' => 'view_stock_quantity'],
        ];

        array_walk($permissionDefaults, function($item) {
            $p = new Permission(['name' => $item['name']]);
            $p->save();
        });
    }
}
