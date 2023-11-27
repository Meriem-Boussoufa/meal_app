import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          customSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals.',
            (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
            activeFilters[Filter.glutenFree]!,
          ),
          customSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals.',
            (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            activeFilters[Filter.lactoseFree]!,
          ),
          customSwitch(
            context,
            'Lactose-free',
            'Only include lactose-free meals.',
            (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
            activeFilters[Filter.vegan]!,
          ),
          customSwitch(
            context,
            'Vegetarian',
            'Only include vegetarian meals.',
            (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterian, value);
            },
            activeFilters[Filter.vegeterian]!,
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(BuildContext context, String title,
      String subtitle, Function(bool newValue) onChanged, bool filter) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
    );
  }
}
