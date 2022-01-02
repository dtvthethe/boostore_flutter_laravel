<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Product extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'image',
        'price',
    ];

    /**
     * Get the product's image uri.
     *
     * @return string
     */
    public function getImageAttribute()
    {
        return $this->attributes['image'] ? Storage::disk('public')->url($this->attributes['image']) : null;
    }

    public function orderDetails() {
        return $this->hasMany(OrderDetail::class);
    }
}
