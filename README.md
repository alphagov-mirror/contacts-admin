# Contacts app

This is a beta for an app to publish contact information for a given
organisation to GOV.UK. In the first instance, it is replacing the
[HMRC contact us application](http://search2.hmrc.gov.uk/kb5/hmrc/contactus/home.page).

## Live examples

This application serves the index/filtering page for contacts, for example:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact

Another application, [contacts-frontend](https://github.com/alphagov/contacts-frontend)
displays the contacts themselves, fetching them from content store:
- https://www.gov.uk/government/organisations/hm-revenue-customs/contact/alcohol-duties-national-registration-unit

## Dependencies

* Ruby 2.1.4
* MySQL
* Rummager (for GOV.UK site search)

## Database setup

The best way to get a database with good seed data is to use a dump from preview,
alternatively you can load the database schema and use the old initial seed data:

    ```
    bundle exec rake db:schema:load
    bundle exec rake db:seed
    bundle exec rake contacts:import_hmrc DATA_FILE=db/contact-records.csv
    ```

## Running

Start the application with `./startup.sh` or use bowler.

open http://contacts.dev.gov.uk/contact/hm-revenue-customs/
open http://contacts.dev.gov.uk/admin

By default, this application uses the GOV.UK preview environment for assets. To
run against a local version of static you need to set `STATIC_DEV` to
"http://static.dev.gov.uk".


## Development notes

* ```app/tasks``` - contains one-off tasks that can be run via console or a rake task.

## Tests

The tests in this project rely upon [govuk-content-schemas](http://github.com/alphagov/govuk-content-schemas). By default these should be in the parent directory, otherwise you can specify their location with the `GOVUK_CONTENT_SCHEMAS_PATH` environment variable.

Assuming you already have govuk-content-schemas cloned:
    ```
    bundle exec rake db:test:prepare RAILS_ENV=test
    bundle exec rspec .
    ```
