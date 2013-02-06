# encoding: utf-8

##
# model
module Model
  ##
  # site
  module Site
    ##
    # get_barracks
    #
    # @return [Hash]
    def self.get_barracks
      {
          :swordsman => {
              :value => :swordsman,
              :english => "Swordsman",
              :russian => "Мечник",
              :power => 20,
              :more_power => {
                  :axeman => 20,
                  :cavalry => 30,
              }
          },
          :spearman => {
              :value => :spearman,
              :english => "Spearman",
              :russian => "Копейщик",
              :power => 34,
              :more_power => {
                  :swordsman => 20,
                  :cavalry => 30,
              }
          },
          :axeman => {
              :value => :axeman,
              :english => "Axeman",
              :russian => "Топорщик",
              :power => 56,
              :more_power => {
                  :spearman => 20,
                  :cavalry => 30,
              }
          },

          :archer => {
              :value => :archer,
              :english => "archer",
              :russian => "Лучник",
              :power => 94,
              :more_power => {
                  :swordsman => 30,
                  :spearman => 30,
                  :axeman => 30
              }
          },
          :cavalry => {
              :value => :cavalry,
              :english => "Cavalry",
              :russian => "Кавалерия",
              :power => 156,
              :more_power => {
                  :axeman => 20,
                  :archer => 30
              }
          },
          :lancer => {
              :value => :lancer,
              :english => "Lancer",
              :russian => "Лансер",
              :power => 258,
              :more_power => {
                  :swordsman => 20,
                  :archer => 30
              }
          },
          :axerider =>
          {
              :value => :axerider,
              :english => "Axerider",
              :russian => "Кон. Топор.",
              :power => 430,
              :more_power => {
                  :spearman => 20,
                  :archer => 30
              }
          }
      }
    end

    ##
    # get_max_cave_count
    #
    # @return [Fixnum]
    def self.get_max_cave_count
      3
    end

    ##
    # arms_center
    #
    # @return [Hash]
    def self.get_arms_centers
      {
          :sword_master => {
              :value => :sword_master,
              :english => "Sword Master",
              :russian => "Мастер меча"
          },
          :sharpest_spear => {
              :value => :sharpest_spear,
              :english => "Sharpest Spear",
              :russian => "Острое копьё"
          },
          :heavy_axe => {
              :value => :heavy_axe,
              :english => "Heavy Axe",
              :russian => "Тяжёлый топор"
          },
          :heavy_infantry => {
              :value => :heavy_infantry,
              :english => "Heavy Infantry",
              :russian => "Тяжёлая пехота"
          },
          :elite_marksman => {
              :value => "elite_marksman",
              :english => "Elite Marksman",
              :russian => "Меткий стрелок"
          },
          :skilled_equestrian => {
              :value => "skilled_equestrian",
              :english => "Skilled Equestrian",
              :russian => "Конный спорт"
          }
      }
    end
  end
end