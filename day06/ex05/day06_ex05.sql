COMMENT ON TABLE person_discounts IS
	'Отображает размер скидки для каждого клиента в различных пиццериях';
COMMENT ON COLUMN person_discounts.id IS
	'Всего лишь уникальный иденификатор';
COMMENT ON COLUMN person_discounts.person_id IS
	'Идентификатор человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS
	'Зубочистку?';
COMMENT ON COLUMN person_discounts.discount IS
	'Собственно, скидочка';
