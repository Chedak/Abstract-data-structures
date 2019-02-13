require "./lib/linked_list"

describe LinkedList do
  test_list = LinkedList.new
  test_list.add("value")
  it "returns a value" do
  expect(test_list.get(0)).to eq("value")
  end
end
