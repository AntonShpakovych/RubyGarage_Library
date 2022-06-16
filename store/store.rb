# frozen_string_literal: true

module Store
  def save(file, data_store)
    File.write(file, data_store.to_yaml)
  end

  private

  def load(filename)
    if File.exist?(filename) && !File.zero?(filename)
      YAML.load_file(filename, permitted_classes: [Order, Book, Author, Reader, Symbol, Date], aliases: true)
    else
      {}
    end
  end
end
