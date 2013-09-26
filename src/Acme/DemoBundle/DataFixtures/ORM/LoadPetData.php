<?php

namespace Acme\DemoBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Acme\DemoBundle\Entity\Pet;

class LoadPetData implements FixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $cat = new Pet();
        $cat->setName('Minka');
        $cat->setAge(5);
        $cat->setDescription('Meine liebste Katze');
        $manager->persist($cat);

        $dog = new Pet();
        $dog->setName('Rex');
        $dog->setAge(10);
        $dog->setDescription('Der will nur spielen!');
        $manager->persist($dog);

        $manager->flush();
    }
}
