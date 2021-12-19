<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Role extends Model
{
    use HasFactory, SoftDeletes;

    const ADMIN = 1;
	const GUEST = 2;

	const ADMIN_TEXT = 'Admin';
	const GUEST_TEXT = 'Guest';

    /**
    * The attributes that are mass assignable.
    *
    * @var array<int, string>
    */
   protected $fillable = [
       'name',
   ];

   /**
    * @return BelongsToMany
    */
   public function permissions() {
       return $this->belongsToMany(Permission::class, 'permission_roles', 'role_id', 'permission_id');
   }
}
