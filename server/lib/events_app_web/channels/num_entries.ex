defmodule CompanyTestWeb.NumEntriesChannel do
#   use CompanyTestWeb, :channel

    alias CompanyTest.Entries

#   @impl true
#   def join("game:" <> name, payload, socket) do
#     if authorized?(payload) do
#       #GameServer.start(name)
#       socket = socket
#       |> assign(:name, name)
#       |> assign(:user, "")
#       {:ok, %{numEntries: length(Entries.list_entries())}, socket}
#     else
#       {:error, %{reason: "unauthorized"}}
#     end
#   end

#   intercept ["view"]

#   @impl true
#   def handle_out("view", msg, socket) do
#     user = socket.assigns[:user]
#     msg = %{msg | name: user}
#     push(socket, "view", msg)
#     {:noreply, socket}
#   end

#   # Add authorization logic here as required.
#   defp authorized?(_payload) do
#     true
#   end
  use Phoenix.Socket

  ## Channels
  # channel "room:*", CompanyTestWeb.RoomChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  @impl true
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def join("game:login", payload, socket) do
    {:ok, %{numEntries: length(Entries.list_entries())}, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     CompanyTestWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  @impl true
  def id(_socket), do: nil

end