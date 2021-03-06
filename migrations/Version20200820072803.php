<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200820072803 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product_image DROP FOREIGN KEY FK_64617F032CB716C7');
        $this->addSql('DROP INDEX IDX_64617F032CB716C7 ON product_image');
        $this->addSql('ALTER TABLE product_image DROP yes_id');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product_image ADD yes_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE product_image ADD CONSTRAINT FK_64617F032CB716C7 FOREIGN KEY (yes_id) REFERENCES product (id)');
        $this->addSql('CREATE INDEX IDX_64617F032CB716C7 ON product_image (yes_id)');
    }
}
