module Helpers
  def fixture_site(overrides = {})
    Jekyll::Site.new(site_configuration(overrides))
  end

  def default_configuration
    # rubocop:disable Security/MarshalLoad
    Marshal.load(Marshal.dump(Jekyll::Configuration::DEFAULTS))
  end

  def build_configs(overrides, base_hash = default_configuration)
    Utils.deep_merge_hashes(base_hash, overrides)
  end

  def site_configuration(overrides = {})
    full_overrides = build_configs(overrides, build_configs(
                                                "destination" => dest_dir,
                                                "incremental" => false
    ))
    Configuration.from(full_overrides.merge("source" => source_dir))
  end
end
