@time_getgm = shared "Time#getgm" do |cmd|
  describe "Time##{cmd}" do
    it "returns a new time which is the utc representation of time" do
      # Testing with America/Regina here because it doesn't have DST.
      with_timezone("CST", -6) do
        t = Time.local(2007, 1, 9, 6, 0, 0)
        t.send(cmd).should == Time.gm(2007, 1, 9, 12, 0, 0)
      end
    end
  end
end
