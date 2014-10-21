defmodule Tentacat.Hooks do
	import Tentacat
	alias Tentacat.Client
	@moduledoc """
	The Repository Webhooks API allows repository admins to manage the post-receive hooks for a repository.
	"""

	@doc """
	Get a list of webhooks for a repository.

	## Example

			Tentacat.Hooks.list("elixir-lang", "elixir", client)

	More info at: http:\\developer.github.com/v3/repos/hooks/#list-hooks
	"""
	@spec list(binary, binary, Client.t) :: Tentacat.response
	def list(owner, repo, client) do
		get "repos/#{owner}/#{repo}/hooks", client.auth
	end

	@doc """
	Get a webhook for a repository by id.

	## Example

			Tentacat.Hooks.get("elixir-lang", "elixir", "1234567", client)

	More info at: http:\\developer.github.com/v3/repos/hooks/#get-single-hook
	"""
	@spec get(binary, binary, binary | integer, Client.t) :: Tentacat.response
	def get(owner, repo, hook_id, client) do
		get "repos/#{owner}/#{repo}/hooks/#{hook_id}", client.auth
	end

	@doc """
	Create webhook for a repository.

	## Example

			Tentacat.Hooks.create("elixir-lang", "elixir", hook_body, client)

	More info at: http:\\developer.github.com/v3/repos/hooks/#create-a-hook
	"""
	@spec create(binary, binary, list, Client.t) :: Tentacat.response
	def create(owner, repo, body, client) do
		post "repos/#{owner}/#{repo}/hooks", client.auth, body
	end

	@doc """

	## Example

			Tentacat.Hooks.edit("elixir-lang", "elixir", "1234567", hook_body, client)

	More info at: http:\\developer.github.com/v3/repos/hooks/#edit-a-hook
	"""
	@spec edit(binary, binary, binary | integer, list, Client.t) :: Tentacat.response
	def edit(owner, repo, hook_id, body, client) do
		patch "repos/#{owner}/#{repo}/hooks/#{hook_id}", client.auth, body
	end

	@doc """
	This will trigger the hook with the latest push to the current repository if the hook is subscribed to push events.
	If the hook is not subscribed to push events, the server will respond with 204 but no test POST will be generated.

	## Example

			Tentacat.Hooks.test("elixir-lang", "elixir", "1234567", client)

	More info at: http:\\developer.github.com/v3/repos/hooks/#test-a-push-hook
	"""
	@spec test(binary, binary, binary | integer, Client.t) :: Tentacat.response
	def test(owner, repo, hook_id, client) do
		post "repos/#{owner}/#{repo}/hooks/#{hook_id}/test", client.auth, ""
	end

	@doc """
	Delete a repo's webhook by it's Id.

	## Example

			Tentacat.Hooks.delete("elixir-lang", "elixir", "1234567", client)

	More info at: http:\\developer.github.com/v3/repos/hooks/#delete-a-hook
	"""
	@spec delete(binary, binary, binary | integer, Client.t) :: Tentacat.response
	def delete(owner, repo, hook_id, client) do
		delete "repos/#{owner}/#{repo}/hooks/#{hook_id}", client.auth
	end

end
