defmodule Plausible.Release do
  @start_apps [
    :postgrex,
    :ecto
  ]
  @app :plausible

  def migrate do
    # Application.ensure_all_started(:plausible)
    IO.puts("Migration should be triggered here")
    # for repo <- repos() do
    #   {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    # end
  end

  def rollback(repo, version) do
    IO.puts("Rollback to version #{version} should be triggered here")
    # {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.load(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
