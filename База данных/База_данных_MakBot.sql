CREATE TABLE "User" (
  "userId" varchar PRIMARY KEY,
  "userStatusId" varchar,
  "name" varchar,
  "userPhone" varchar,
  "email" varchar UNIQUE,
  "bonusId" varchar
);

CREATE TABLE "Dishes" (
  "dishId" varchar PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "menuId" varchar,
  "photo" varchar,
  "recipeId" varchar,
  "proteins" decimal(5,2),
  "fats" decimal(5,2),
  "carbohydrates" decimal(5,2),
  "calorie" decimal(5,2),
  "coefficientId" varchar,
  "price" decimal(10,2)
);

CREATE TABLE "Menu" (
  "menuId" varchar PRIMARY KEY,
  "categoryName" varchar,
  "expiryDateTime" timestamp,
  "activeStatus" boolean
);

CREATE TABLE "Recipe" (
  "recipeId" varchar PRIMARY KEY,
  "name" varchar,
  "ingredientId" varchar,
  "defaultQty" integer,
  "maxQty" integer,
  "minQty" integer,
  "required" boolean,
  "recipeType" varchar,
  "qty" integer
);

CREATE TABLE "Ingredient" (
  "ingredientId" varchar PRIMARY KEY,
  "name" varchar,
  "proteins" decimal(5,2),
  "fats" decimal(5,2),
  "carbohydrates" decimal(5,2),
  "calorie" decimal(5,2),
  "photo" varchar,
  "qty" decimal(10,2),
  "batch" varchar,
  "price" decimal(10,2),
  "expiryDateTime" timestamp
);

CREATE TABLE "Order" (
  "orderId" varchar PRIMARY KEY,
  "detailNo" varchar,
  "userId" varchar,
  "orderDateTime" timestamp,
  "orderStatusId" varchar,
  "typeOfDeliveryId" varchar,
  "timeOfDelivery" timestamp,
  "amount" decimal(10,2),
  "paymentId" varchar
);

CREATE TABLE "Bonus" (
  "bonusId" varchar PRIMARY KEY,
  "userId" varchar,
  "paymentId" varchar,
  "bonusDateTime" timestamp,
  "accrual" decimal(10,2),
  "subtract" decimal(10,2),
  "bonusExpiryDate" timestamp,
  "bonusPriceCoefficient" decimal(10,2)
);

CREATE TABLE "Payment" (
  "paymentId" varchar PRIMARY KEY,
  "typeOfPaymentId" varchar,
  "dateTime" timestamp,
  "bankPaymentId" varchar,
  "total" decimal(10,2)
);

CREATE TABLE "OrderStatus" (
  "orderStatusId" varchar PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "TypeOfDelivery" (
  "typeOfDeliveryId" varchar PRIMARY KEY,
  "name" varchar
);


CREATE TABLE "UserStatus" (
  "userStatusId" varchar PRIMARY KEY,
  "userId" varchar,
  "name" varchar
);

-- Добавление внешних ключей
ALTER TABLE "Order" ADD FOREIGN KEY ("userId") REFERENCES "User" ("userId");
ALTER TABLE "Bonus" ADD FOREIGN KEY ("userId") REFERENCES "User" ("userId");
ALTER TABLE "Dishes" ADD FOREIGN KEY ("menuId") REFERENCES "Menu" ("menuId");
ALTER TABLE "Dishes" ADD FOREIGN KEY ("recipeId") REFERENCES "Recipe" ("recipeId");
ALTER TABLE "Recipe" ADD FOREIGN KEY ("ingredientId") REFERENCES "Ingredient" ("ingredientId");
ALTER TABLE "Order" ADD FOREIGN KEY ("paymentId") REFERENCES "Payment" ("paymentId");
ALTER TABLE "Order" ADD FOREIGN KEY ("orderStatusId") REFERENCES "OrderStatus" ("orderStatusId");
ALTER TABLE "Order" ADD FOREIGN KEY ("typeOfDeliveryId") REFERENCES "TypeOfDelivery" ("typeOfDeliveryId");
ALTER TABLE "UserStatus" ADD FOREIGN KEY ("userId") REFERENCES "User" ("userId");