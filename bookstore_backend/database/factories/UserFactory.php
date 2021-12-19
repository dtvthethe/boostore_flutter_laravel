<?php

namespace Database\Factories;

use Common;
use Illuminate\Database\Eloquent\Factories\Factory;

class UserFactory extends Factory
{
    const PWD_DEAFULT = '$2y$10$ybDcemBcmCmlwBxLGWYTlOOR1sswdVM6me2pnjjWqebVz1V6ORyVC';
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'password' => self::PWD_DEAFULT,
            'phone' => $this->faker->numerify('###########'),
            'avatar' => 'users/' . random_int(1, 10) . '.png',
            'display_name' => $this->faker->name(),
        ];
    }
}
