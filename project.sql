CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "service_ticket" (
  "ticket_id" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "mechanic_id" INTEGER,
  "repair_type" VARCHAR(100),
  "service_ticket_date" DATE,
  "invoice_number" INTEGER,
  PRIMARY KEY ("ticket_id"),
  CONSTRAINT "FK_service_ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_service_ticket.mechanic_id"
    FOREIGN KEY ("mechanic_id")
      REFERENCES "mechanic"("mechanic_id")
);

CREATE TABLE "car" (
  "car_id" SERIAL,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "year" VARCHAR(4),
  "car_price" VARCHAR(10),
  "new_used" VARCHAR(100),
  PRIMARY KEY ("car_id"),
  CONSTRAINT "FK_car.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "service_ticket"("car_id")
);

CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "invoice" (
  "invoice_number" SERIAL,
  "salesperson_id" INTEGER,
  "customer_id" INTEGER,
  "invoice_date" DATE,
  "car_id" INTEGER,
  "price" VARCHAR(10),
  PRIMARY KEY ("invoice_number"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_invoice.invoice_number"
    FOREIGN KEY ("invoice_number")
      REFERENCES "service_ticket"("invoice_number"),
  CONSTRAINT "FK_invoice.salesperson_id"
    FOREIGN KEY ("salesperson_id")
      REFERENCES "salesperson"("salesperson_id")
);

CREATE TABLE "service_history" (
  "service_number" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "history_repair_type" VARCHAR(100),
  "mechanic_id" INTEGER,
  "service_history_date" DATE,
  "service_price" VARCHAR(10),
  "ticket_id" INTEGER,
  PRIMARY KEY ("service_number"),
  CONSTRAINT "FK_service_history.ticket_id"
    FOREIGN KEY ("ticket_id")
      REFERENCES "service_ticket"("ticket_id")
);