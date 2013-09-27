<?php

namespace Acme\DemoBundle\Tests;

class DemoTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @dataProvider getNumbers
     */
    public function testSum($num1, $num2, $sum)
    {
        $this->assertEquals($sum, $num1 + $num2);
    }

    /**
     * TODO: fixme, we are waiting!!!111
     */
    public function getNumbers()
    {
        return array(
            array(2, 3, 5),
            array(1, 7, 8),
            array(4, 1, 6)
        );
    }
}
