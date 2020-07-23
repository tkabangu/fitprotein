<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200723161142 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE opinion ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE product ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE product_image ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE promo_code ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL, ADD started_at DATETIME NOT NULL, ADD ended_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE user ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE opinion DROP created_at, DROP updated_at');
        $this->addSql('ALTER TABLE product DROP created_at, DROP updated_at');
        $this->addSql('ALTER TABLE product_image DROP created_at, DROP updated_at');
        $this->addSql('ALTER TABLE promo_code DROP created_at, DROP updated_at, DROP started_at, DROP ended_at');
        $this->addSql('ALTER TABLE user DROP created_at, DROP updated_at');
    }
}
