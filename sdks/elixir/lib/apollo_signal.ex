defmodule ApolloSignal do
  @moduledoc "Apollo Signal API API client.\n\nThis module is the stable entry point for the generated Mix library."

  @spec new(keyword()) :: ApolloSignal.Client.t()
  def new(opts \\ []) do
    ApolloSignal.Client.new(opts)
  end
end
