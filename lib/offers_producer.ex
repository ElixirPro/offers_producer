defmodule OffersProducer do
  @topic "ofertas"

  def execute do
    client_id = :my_client
    hosts = [localhost: 9092]

    payload = %{test: 123}

    :ok = :brod.start_client(hosts, client_id)
    :ok = :brod.start_producer(client_id, @topic, [])

    payload_json =
      payload
      |> Jason.encode!()

    :brod.produce(client_id, @topic, 0, _key = "", payload_json)
  end
end
