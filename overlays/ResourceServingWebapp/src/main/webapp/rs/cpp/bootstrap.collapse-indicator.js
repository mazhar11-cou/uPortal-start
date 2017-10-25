/*
# Bootstrap Collapse Indicator

This Bootstrap plugin facilitates the updating of an indicator for Boostrap's
collapse.

## Usage

### HTML
Start with the basic markup for Bootstrap's collapse.

```
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading" id="headingOne">
			<h4 class="panel-title">
				<span class="glyphicon" aria-hidden="true"></span>
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">
					One Fox
				</a>
			</h4>
		</div>

		<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			<div class="panel-body">
				<p>The quick brown fox jumped over the lazy dog.</p>
			</div>
		</div>
	</div>
	<!-- Add additional "panels" here -->
</div>
```

### JavaScript

```
<script>$('#accordion').collapseIndicator()</script>
```

## Customization
```
<script>$('#accordion').collapseIndicator({
	indicatorBaseClass: 'glyphicon',
	expandedIndicator: 'glyphicon-chevron-down',
	collapsedIndicator: 'glyphicon-chevron-right'
})</script>
```
*/

(function( $ ) {
	$.fn.collapseIndicator = function( options ) {
		// Defaults
		var defaults = {
			indicatorBaseClass: 'glyphicon',
			expandedIndicator: 'glyphicon-chevron-down',
			collapsedIndicator: 'glyphicon-chevron-right'
		};

		var panelGroupSelector = '#' + this.attr( 'id' );
		var settings = $.extend( {}, defaults, options );

		updateIndicator( panelGroupSelector, settings );

		$( panelGroupSelector + '.panel-group' )
			.on( 'shown.bs.collapse', function( event ) {
				updateIndicator( panelGroupSelector, settings );
		});

		$( panelGroupSelector + '.panel-group' )
			.on( 'hidden.bs.collapse', function( event ) {
				updateIndicator( panelGroupSelector, settings );
		});

		return this;
	}

	function updateIndicator( panelGroupSelector, settings ) {
		$( panelGroupSelector ).find( '.panel-title' ).each(function( i, value ) {
				var ariaExpanded = $( 'a', value ).attr( 'aria-expanded' );
				var cssClasses = settings.indicatorBaseClass;

				if( ariaExpanded == 'true' ) {
						cssClasses += ' ' + settings.expandedIndicator;
				}
				else if( ariaExpanded == 'false' ) {
					cssClasses += ' ' + settings.collapsedIndicator;
				}

				$( value ).find( '.' + settings.indicatorBaseClass )
					.attr( 'class', cssClasses );
		});
	}
}) ( jQuery || up.jQuery );
