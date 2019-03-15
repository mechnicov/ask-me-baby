## ¿Спроси вопрос?

### Description

Social networking site where users create profiles and can send each other questions. Anonymous questions are also possible.

There is a customization of the user page. User can change background color, font color, avatar border color.

reCAPTCHA is used to protect against spam.

For the convenience of users, hashtags service is used.

Implemented in Ruby 2.5.1, Rails 5.2.

Language: Russian.

### Launching

1. Download or clone repo. Use bundler

```bash
$ bundle install
```

NB: If you want at the same time create the database, load the schema and initialize it with the seed data run

```bash
$ rails db:setup
```

Skip Items 2-4 in this case.

2. Create database

```bash
$ rails db:create
```

3. Run database migrations

```bash
$ rails db:migrate
```

4. If you want to populate your database with seed data run

```bash
$ rails db:seed
```

5. You have to assign values to the environment variables `RECAPTCHA_SITE_KEY` and `RECAPTCHA_SECRET_KEY`. See `.env.example` for this purpose (Note: `.env` is ignored by Git as default).

6. For Rails server starting, type

```bash
$ rails s
```

### License

MIT – see `LICENSE`

### Contacts

Email me at

```rb
'dcdl-snotynu?fl`hk-bnl'.each_char.map(&:succ).join
```
