defmodule TelemetryDeployex.Metrics do
  @moduledoc """
  Structure to handle the metric version structure
  """
  @type t :: %__MODULE__{
          name: String.t(),
          version: String.t(),
          value: integer() | float(),
          unit: String.t(),
          info: String.t(),
          tags: list(),
          type: String.t()
        }

  defstruct name: "unknown",
            version: Application.spec(:telemetry_deployex, :vsn) |> to_string,
            value: "",
            unit: "",
            info: "",
            tags: [],
            type: ""
end