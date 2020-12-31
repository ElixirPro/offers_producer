defmodule OffersProducer do
  @topic "ofertas"

  def executed,
    do:
      %{name: "Playstation", discount: 50, price: 1000}
      |> send_msg

  def execute,
    do:
      %{name: "XboX", discount: 30, price: 1000}
      |> send_msg

  def send_msg(payload) do
    client_id = :my_client
    hosts = [localhost: 9092]

    :ok = :brod.start_client(hosts, client_id)
    :ok = :brod.start_producer(client_id, @topic, [])

    payload_json =
      payload
      |> Jason.encode!()

    :brod.produce(client_id, @topic, 0, _key = "", payload_json)
  end
end
