<?php

namespace App\Listener;

<<<<<<< HEAD
use App\Entity\Product;
=======
use App\Entity\Picture;
use App\Entity\Property;
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Doctrine\ORM\Event\PreFlushEventArgs;
use Doctrine\ORM\Event\PreUpdateEventArgs;
use Liip\ImagineBundle\Imagine\Cache\CacheManager;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Vich\UploaderBundle\Templating\Helper\UploaderHelper;

class ImageCacheSubscriber implements EventSubscriber
{

    /**
     * @var CacheManager
     */
    private $cacheManager;

    /**
     * @var UploaderHelper
     */
    private $uploaderHelper;

    public function __construct(CacheManager $cacheManager, UploaderHelper $uploaderHelper)
    {
        $this->cacheManager = $cacheManager;
        $this->uploaderHelper = $uploaderHelper;
    }

    public function getSubscribedEvents()
    {
        return [
            'preRemove',
            'preUpdate'
        ];
    }

    public function preRemove(LifecycleEventArgs $args) {
        $entity = $args->getEntity();
<<<<<<< HEAD
        if (!$entity instanceof Product) {
=======
        if (!$entity instanceof Picture) {
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
            return;
        }
        $this->cacheManager->remove($this->uploaderHelper->asset($entity, 'imageFile'));
    }

    public function preUpdate(PreUpdateEventArgs $args) {
        $entity = $args->getEntity();
<<<<<<< HEAD
        if (!$entity instanceof Product) {
=======
        if (!$entity instanceof Picture) {
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
            return;
        }
        if ($entity->getImageFile() instanceof UploadedFile) {
            $this->cacheManager->remove($this->uploaderHelper->asset($entity, 'imageFile'));
        }
    }

}
