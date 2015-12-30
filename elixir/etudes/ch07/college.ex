defmodule College do
  def make_room_list(file) do
    case File.open(file, [:read, :utf8]) do
      {:ok, device} ->
        dict = read(device, HashDict.new())
        File.close(device)
        dict
      {:error, _} -> :error
    end
  end

  defp read(device, dict) do
    case IO.read(device, :line) do
      :eof -> dict
      line ->
        [_id, name, room] = String.split(String.strip(line), ",")
        classes = HashDict.get(dict, room, [])
        read(device, HashDict.put(dict, room, [name | classes]))
    end
  end
end
