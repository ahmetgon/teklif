CREATE TABLE `client_scope_entries` (
  `id` int(11) NOT NULL,
  `scope_id` int(11) NOT NULL,
  `selection_id` int(11) NOT NULL,
  `included` tinyint(1) NOT NULL DEFAULT 1,
  `quantity` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `client_scope_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_client_scope_entries_scope` (`scope_id`),
  ADD KEY `fk_client_scope_entries_selection` (`selection_id`);

ALTER TABLE `client_scope_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `client_scope_entries`
  ADD CONSTRAINT `fk_client_scope_entries_scope` FOREIGN KEY (`scope_id`) REFERENCES `scopes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_client_scope_entries_selection` FOREIGN KEY (`selection_id`) REFERENCES `scope_selections` (`id`) ON DELETE CASCADE;
