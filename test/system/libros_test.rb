require "application_system_test_case"

class LibrosTest < ApplicationSystemTestCase
  setup do
    @libro = libros(:one)
  end

  test "visiting the index" do
    visit libros_url
    assert_selector "h1", text: "Libros"
  end

  test "should create libro" do
    visit libros_url
    click_on "New libro"

    fill_in "Autor", with: @libro.autor_id
    fill_in "Editorial", with: @libro.editorial
    fill_in "Fechapub", with: @libro.fechaPub
    fill_in "Nombre", with: @libro.nombre
    click_on "Create Libro"

    assert_text "Libro was successfully created"
    click_on "Back"
  end

  test "should update Libro" do
    visit libro_url(@libro)
    click_on "Edit this libro", match: :first

    fill_in "Autor", with: @libro.autor_id
    fill_in "Editorial", with: @libro.editorial
    fill_in "Fechapub", with: @libro.fechaPub
    fill_in "Nombre", with: @libro.nombre
    click_on "Update Libro"

    assert_text "Libro was successfully updated"
    click_on "Back"
  end

  test "should destroy Libro" do
    visit libro_url(@libro)
    click_on "Destroy this libro", match: :first

    assert_text "Libro was successfully destroyed"
  end
end
