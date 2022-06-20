# frozen_string_literal: true

module Store
  PERMITTED_CLASSES = [Order, Book, Author, Reader, Symbol, Date].freeze
  YAML_OPTIONS = { permitted_classes: PERMITTED_CLASSES, aliases: true }.freeze

  def save(file, data_store)
    File.write(file, data_store.to_yaml)
  end

  private

  def load(filename)
    File.exist?(filename) && !File.zero?(filename) ? YAML.load_file(filename, **YAML_OPTIONS) : {}
  end
end
