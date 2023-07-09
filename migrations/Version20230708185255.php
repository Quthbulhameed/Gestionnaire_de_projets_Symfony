<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230708185255 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE invite CHANGE projet_id projet_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE invite RENAME INDEX email TO IDX_C7E210D7E7927C74');
        $this->addSql('ALTER TABLE invite RENAME INDEX projet_id TO IDX_C7E210D7C18272');
        $this->addSql('ALTER TABLE projet CHANGE utilisateur_id utilisateur_id INT DEFAULT NULL, CHANGE description description LONGTEXT DEFAULT NULL, CHANGE date_debut date_debut DATE NOT NULL, CHANGE date_fin date_fin DATE NOT NULL');
        $this->addSql('ALTER TABLE projet RENAME INDEX fk_projet_utilisateur TO IDX_50159CA9FB88E14F');
        $this->addSql('ALTER TABLE tache DROP FOREIGN KEY fk_tache_projet');
        $this->addSql('ALTER TABLE tache CHANGE priorite_id priorite_id INT DEFAULT NULL, CHANGE statut_id statut_id INT DEFAULT NULL, CHANGE projet_id projet_id INT DEFAULT NULL, CHANGE description description LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE tache ADD CONSTRAINT FK_93872075C18272 FOREIGN KEY (projet_id) REFERENCES projet (id)');
        $this->addSql('ALTER TABLE tache RENAME INDEX fk_tache_priorite TO IDX_9387207553B4F1DE');
        $this->addSql('ALTER TABLE tache RENAME INDEX fk_tache_statut TO IDX_93872075F6203804');
        $this->addSql('ALTER TABLE tache RENAME INDEX fk_tache_projet TO IDX_93872075C18272');
        $this->addSql('ALTER TABLE tasks RENAME INDEX user_id TO IDX_50586597A76ED395');
        $this->addSql('ALTER TABLE user DROP INDEX idx_user_email, ADD UNIQUE INDEX UNIQ_8D93D649E7927C74 (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE messenger_messages');
        $this->addSql('ALTER TABLE invite CHANGE projet_id projet_id INT NOT NULL');
        $this->addSql('ALTER TABLE invite RENAME INDEX idx_c7e210d7e7927c74 TO email');
        $this->addSql('ALTER TABLE invite RENAME INDEX idx_c7e210d7c18272 TO projet_id');
        $this->addSql('ALTER TABLE projet CHANGE utilisateur_id utilisateur_id INT NOT NULL, CHANGE description description TEXT DEFAULT NULL, CHANGE date_debut date_debut DATE DEFAULT NULL, CHANGE date_fin date_fin DATE DEFAULT NULL');
        $this->addSql('ALTER TABLE projet RENAME INDEX idx_50159ca9fb88e14f TO fk_projet_utilisateur');
        $this->addSql('ALTER TABLE tache DROP FOREIGN KEY FK_93872075C18272');
        $this->addSql('ALTER TABLE tache CHANGE priorite_id priorite_id INT NOT NULL, CHANGE statut_id statut_id INT NOT NULL, CHANGE projet_id projet_id INT NOT NULL, CHANGE description description TEXT NOT NULL');
        $this->addSql('ALTER TABLE tache ADD CONSTRAINT fk_tache_projet FOREIGN KEY (projet_id) REFERENCES projet (id) ON UPDATE CASCADE ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tache RENAME INDEX idx_9387207553b4f1de TO fk_tache_priorite');
        $this->addSql('ALTER TABLE tache RENAME INDEX idx_93872075c18272 TO fk_tache_projet');
        $this->addSql('ALTER TABLE tache RENAME INDEX idx_93872075f6203804 TO fk_tache_statut');
        $this->addSql('ALTER TABLE tasks DROP FOREIGN KEY FK_50586597A76ED395');
        $this->addSql('ALTER TABLE tasks RENAME INDEX idx_50586597a76ed395 TO user_id');
        $this->addSql('ALTER TABLE user DROP INDEX UNIQ_8D93D649E7927C74, ADD INDEX idx_user_email (email)');
    }
}
