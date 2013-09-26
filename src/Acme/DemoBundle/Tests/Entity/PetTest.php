<?php

namespace Acme\DemoBundle\Tests\Entity;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class PetTest extends WebTestCase
{
    /**
     * @var Doctrine\ORM\EntityManager
     */
    protected $em;

    /**
     * @var Container
     */
    protected $container;

    public function setUp()
    {
        parent::setUp();

        $client = static::createClient();
        $this->container = $client->getContainer();

        $this->em = $this->container
            ->get('doctrine')
            ->getManager();
    }

    public function testUpdateAge()
    {
        $catRepository = $this->container->get('doctrine')->getRepository('AcmeDemoBundle:Pet');

        $cat = $catRepository->findOneByName('Minka');
        $oldAge = $cat->getAge();
        $cat->setAge($oldAge + 1);
        $this->em->persist($cat);
        $this->em->flush();
        
        $cat2 = $catRepository->findOneById($cat->getId());
        $this->assertEquals($oldAge + 1, $cat2->getAge());
    }
    
    public function tearDown()
    {
        if (isset($this->em)) {
            $this->em->close();
            $this->em->getConnection()->close();
        }

        unset($this->em);
        unset($this->container);

        parent::tearDown();
    }
}
