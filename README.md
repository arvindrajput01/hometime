# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


rails generate model reservation reservation_code: string start_date: datetime end_date:datetime nights:integer guests:integer adults:integer children:integer infants:integer status:string currency:string payout_price:decimal security_price:decimal total_price:decimal localized_description:string guest_id: integer
