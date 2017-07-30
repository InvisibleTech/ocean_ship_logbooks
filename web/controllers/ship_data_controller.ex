defmodule OceanShipLogbooks.ShipDataController do
  use OceanShipLogbooks.Web, :controller
  alias OceanShipLogbooks.ShipData

  def index(conn, _params) do
    # For entertainment purposes only, we are picking a ship.
    query = from s in ShipData,
      where: s.ship == "Endeavour",
      order_by: [asc: s.utc],
      select: s

    ships = Repo.all(query)
    render(conn, "show_ships.json", ships)
  end

  def import_from_csv() do
    File.stream!("ship-data.csv")
    |> CSV.decode!(headers: true)
    |> Stream.filter(fn(x) -> x["Lat3"] != "NA" and x["Lon3"] != "NA" end)
    |> Stream.map(&build_ship/1)
    |> Enum.each(&OceanShipLogbooks.Repo.insert!/1)
  end

  defp build_ship(row) do
     {lat, _} = Float.parse(row["Lat3"])
     {lon, _} = Float.parse(row["Lon3"])
     {utc, _} = Integer.parse(row["UTC"])

     # WTF SRID 4326 -  fucking look it up bitch.
     geom = %Geo.Point{coordinates: {lat, lon}, srid: 4326}
     %OceanShipLogbooks.ShipData{ship: row["ShipName"], utc: utc, geom: geom}
  end
end
