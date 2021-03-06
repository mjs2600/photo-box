use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :photo_box, PhotoBox.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :photo_box, PhotoBox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATABASE_POSTGRESQL_USERNAME") || "postgres",
  password: System.get_env("DATABASE_POSTGRESQL_PASSWORD") || "postgres",
  database: "photo_box_test",
  size: 1,
  max_overflow: 0


config :photo_box, photo_dir: "test/priv"
