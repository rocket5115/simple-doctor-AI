DROP TABLE IF EXISTS `basia`;
CREATE TABLE IF NOT EXISTS `basia` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;
