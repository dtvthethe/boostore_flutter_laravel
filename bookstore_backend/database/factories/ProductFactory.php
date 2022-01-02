<?php

namespace Database\Factories;

use Common;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->firstName(),
            'image' => 'products/' . random_int(1, 10) . '.png',
            'price' => random_int(1, 200),
						'quantity' => 10,
        ];
    }
}
