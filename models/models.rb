# encoding: utf-8

module Models
  def self.get_data
    YAML.load_file "models/models.yaml"
  end
end
