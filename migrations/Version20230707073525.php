<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230707073525 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE tache DROP FOREIGN KEY fk_tache_priorite');
        $this->addSql('ALTER TABLE tache DROP FOREIGN KEY fk_tache_projet');
        $this->addSql('ALTER TABLE tache DROP FOREIGN KEY fk_tache_statut');
        $this->addSql('DROP TABLE priorite');
        $this->addSql('DROP TABLE statut');
        $this->addSql('DROP TABLE tache');
        $this->addSql('ALTER TABLE projet CHANGE utilisateur_id utilisateur_id INT DEFAULT NULL, CHANGE description description LONGTEXT DEFAULT NULL, CHANGE date_debut date_debut DATE NOT NULL, CHANGE date_fin date_fin DATE NOT NULL');
        $this->addSql('ALTER TABLE projet RENAME INDEX fk_projet_utilisateur TO IDX_50159CA9FB88E14F');
        $this->addSql('ALTER TABLE tasks RENAME INDEX user_id TO IDX_50586597A76ED395');
        $this->addSql('ALTER TABLE user DROP INDEX idx_user_email, ADD UNIQUE INDEX UNIQ_8D93D649E7927C74 (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE priorite (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE statut (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE tache (id INT AUTO_INCREMENT NOT NULL, priorite_id INT NOT NULL, statut_id INT NOT NULL, projet_id INT NOT NULL, nom VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, description TEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, date_echeance DATE NOT NULL, INDEX fk_tache_priorite (priorite_id), INDEX fk_tache_projet (projet_id), INDEX fk_tache_statut (statut_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE tache ADD CONSTRAINT fk_tache_priorite FOREIGN KEY (priorite_id) REFERENCES priorite (id)');
        $this->addSql('ALTER TABLE tache ADD CONSTRAINT fk_tache_projet FOREIGN KEY (projet_id) REFERENCES projet (id) ON UPDATE CASCADE ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tache ADD CONSTRAINT fk_tache_statut FOREIGN KEY (statut_id) REFERENCES statut (id)');
        $this->addSql('DROP TABLE messenger_messages');
        $this->addSql('ALTER TABLE projet CHANGE utilisateur_id utilisateur_id INT NOT NULL, CHANGE description description TEXT DEFAULT NULL, CHANGE date_debut date_debut DATE DEFAULT NULL, CHANGE date_fin date_fin DATE DEFAULT NULL');
        $this->addSql('ALTER TABLE projet RENAME INDEX idx_50159ca9fb88e14f TO fk_projet_utilisateur');
        $this->addSql('ALTER TABLE tasks DROP FOREIGN KEY FK_50586597A76ED395');
        $this->addSql('ALTER TABLE tasks RENAME INDEX idx_50586597a76ed395 TO user_id');
        $this->addSql('ALTER TABLE user DROP INDEX UNIQ_8D93D649E7927C74, ADD INDEX idx_user_email (email)');
    }
}
