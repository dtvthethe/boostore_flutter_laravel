<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    const PWD_DEAFULT = '$2y$10$ybDcemBcmCmlwBxLGWYTlOOR1sswdVM6me2pnjjWqebVz1V6ORyVC';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'password',
        'phone',
        'avatar',
        'display_name',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * @return BelongsToMany
     */
    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class, 'user_roles', 'user_id', 'role_id');
    }

    /**
     * @return bool
     */
    public function hasRole(string $roleName)
    {
        return $this->roles->contains('name', $roleName);
    }

    /**
     * @return bool
     */
    public function hasPermission(string $permissionName)
    {
        $permissions = $this->roles->first()->permissions;

        return $permissions->contains('name', $permissionName);
    }

    public function orders() {
        return $this->hasMany(Order::class);
    }
}
