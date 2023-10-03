/*
  Warnings:

  - You are about to drop the column `rooute` on the `rols` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `rols` DROP COLUMN `rooute`,
    ADD COLUMN `route` VARCHAR(255) NULL;
