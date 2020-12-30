defmodule OffersProducer do
  @topic "ofertas"

  def executed,
    do:
      %{test: 123, discount: 50}
      |> send_msg

  def execute,
    do:
      %{test: 123, discount: 30}
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
