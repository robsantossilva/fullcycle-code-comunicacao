-- SQLite
CREATE TABLE categories
(
  id string,
  name string,
  description string
);

CREATE TABLE courses
(
  id string,
  name string,
  description string,
  category_id string
);