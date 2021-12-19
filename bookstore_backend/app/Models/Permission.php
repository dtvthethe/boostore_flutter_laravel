<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Permission extends Model
{
    use HasFactory, SoftDeletes;

	const VIEW_STOCK_QUANTIRY = 1;
	const VIEW_STOCK_QUANTIRY_TEXT = 'view_stock_quantity';
}
