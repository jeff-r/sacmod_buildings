module ArchitectsHelper
  def next_architect_link(architect)
    link_to "next", architect.next
  end

  def prev_architect_link(architect)
    link_to "previous", architect.prev
  end
end
