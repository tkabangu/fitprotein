<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200820075028 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product_image ADD picture_id INT NOT NULL');
        $this->addSql('ALTER TABLE product_image ADD CONSTRAINT FK_64617F03EE45BDBF FOREIGN KEY (picture_id) REFERENCES product (id)');
        $this->addSql('CREATE INDEX IDX_64617F03EE45BDBF ON product_image (picture_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product_image DROP FOREIGN KEY FK_64617F03EE45BDBF');
        $this->addSql('DROP INDEX IDX_64617F03EE45BDBF ON product_image');
        $this->addSql('ALTER TABLE product_image DROP picture_id');
    }
}
